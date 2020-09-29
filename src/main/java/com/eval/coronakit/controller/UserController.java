package com.eval.coronakit.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eval.coronakit.entity.CoronaKit;
import com.eval.coronakit.entity.KitDetail;
import com.eval.coronakit.entity.ProductMaster;
import com.eval.coronakit.entity.UserAddress;
import com.eval.coronakit.exception.ProductException;
import com.eval.coronakit.service.CoronaKitService;
import com.eval.coronakit.service.KitDetailService;
import com.eval.coronakit.service.ProductService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CoronaKitService coronaKitService;
	
	@Autowired
	KitDetailService kitDetailService;
	
	@RequestMapping("/home")
	public String home() {
		return "user-home";
	}
	
	@RequestMapping("/show-kit")
	public String showKit(HttpSession session,Model model) {
		  List<ProductMaster> selectedProductsList = (List<ProductMaster>)session.getAttribute("selectedProductsList");
//		  Double totalAmount = 0d;
//		  for(ProductMaster prodmast : selectedProductsList)
//		  {
//			  totalAmount = prodmast.getCost() * prodmast.getReqQuantity() + totalAmount;
//			  prodmast.setTotalCost(prodmast.getCost() * prodmast.getReqQuantity());
//		  }
//		 
//		  session.setAttribute("totalAmt", totalAmount);
		return "show-cart";
	}

	@RequestMapping("/show-list")
	public String showList(Model model,HttpSession session) {
		model.addAttribute("productlist", productService.getAllProducts());
		session.setAttribute("productlist", productService.getAllProducts());
		session.setAttribute("selectedProductsList", null);
		session.removeAttribute("cartproduct");
		session.removeAttribute("cartaddedproduct");
		session.removeAttribute("Qtymap");
		return "show-all-item-user";
	}
	
	@RequestMapping("/add-to-cart")
	public String showKit(@RequestParam("productId") int productId,@RequestParam("reqQuantity") String reqQuantity,HttpSession session,Model model) {

		 List<ProductMaster> selectedProductsList = (List<ProductMaster>) session.getAttribute("selectedProductsList");
		List<ProductMaster> productsList = (List<ProductMaster>) session.getAttribute("productlist");
		  System.out.println("req quan " + reqQuantity);
		 
		if(null == productsList)
		{
			productsList = new ArrayList<ProductMaster>();
		}
		if(null == selectedProductsList)
		{
			selectedProductsList = new ArrayList<ProductMaster>();
		}
		String productName = null;
		for(ProductMaster prodmast : productsList)
		{
			
			if(prodmast.getId()==productId && !reqQuantity.isEmpty() && Integer.parseInt(reqQuantity)>0)
			{
				prodmast.setReqQuantity(Integer.parseInt(reqQuantity));
				productName = prodmast.getProductName();
				selectedProductsList.add(prodmast);
				break;
			}
			
			else if (prodmast.getId()==productId && (reqQuantity.isEmpty() || Integer.parseInt(reqQuantity)==0))
			{
				
				productName = prodmast.getProductName();
				model.addAttribute("msg", "Please select the reuired quantity");
				return "show-all-item-user";
			}
			 
		}
		
			System.out.println("list" + productsList.size());
			model.addAttribute("msg", "Product " + productName + " is added to cart");
			
			for(ProductMaster prodmast : productsList)
			{
				System.out.println("list" + prodmast.getId());
				System.out.println("list" + prodmast.getReqQuantity());
			}
			model.addAttribute("productlist",productsList);
			session.setAttribute("selectedProductsList", selectedProductsList);
			
		return "show-all-item-user";
		
	
	}
	
	@RequestMapping("/checkout")
	public String checkout(Model model) {
		model.addAttribute("Address", new UserAddress());
		return "checkout-address";
	}
	
	@PostMapping("/finalize")
	public String finalizeOrder(@ModelAttribute("Address") @Valid UserAddress userAddress,BindingResult rs,Model model,HttpSession session) throws ProductException {
		String view=null;
		if (!rs.hasErrors())
		{		
		KitDetail k;
		int totalamount=0;
		List<ProductMaster> selectedProdList=(List<ProductMaster>)session.getAttribute("selectedProductsList");
		for(ProductMaster product:selectedProdList) {
			totalamount=totalamount+(product.getReqQuantity()*product.getCost());
		}
		
		
		model.addAttribute("Address1",userAddress.getAddress1());
		model.addAttribute("Address2",userAddress.getAddress2());
		model.addAttribute("City",userAddress.getCity());
		model.addAttribute("State",userAddress.getState());
		
	
		CoronaKit kit=new CoronaKit();

		kit.setDeliveryAddress(userAddress);
		kit.setOrderDate(LocalDate.now().toString());
		kit.setTotalAmount(totalamount);
		coronaKitService.saveKit(kit);
		
		for(ProductMaster p:selectedProdList) {
			
			k= new KitDetail(kit.getId(),p.getId(),p.getProductName(),p.getReqQuantity().intValue(),(p.getReqQuantity()*p.getCost()));
			kitDetailService.addKitItem(k);
		}
		List<KitDetail> details=kitDetailService.getAllKitItemsOfAKit(kit.getId());
		model.addAttribute("kitdetails", details);
		session.setAttribute("Totalamount", totalamount);
		session.setAttribute("OrderID", kit.getId());
		view= "show-summary";
		}
		else
		{
			view="checkout-address";
		}
		return view;
	}
	
	@RequestMapping("/delete")
	public String deleteItem(@RequestParam("productId") int productId,@RequestParam("reqQuantity") String reqQuantity,HttpSession session,Model model) {
		 List<ProductMaster> selectedProductsList = (List<ProductMaster>) session.getAttribute("selectedProductsList");
		List<ProductMaster> productsList = (List<ProductMaster>) session.getAttribute("productlist");
		 
		if(null == productsList)
		{
			productsList = new ArrayList<ProductMaster>();
		}
		if(null == selectedProductsList)
		{
			selectedProductsList = new ArrayList<ProductMaster>();
		}
		String productName = null;
		for(ProductMaster prodmast : productsList)
		{
			
			
			 if(prodmast.getId()==productId && !reqQuantity.isEmpty() && Integer.parseInt(reqQuantity)==0)
			 {
				 model.addAttribute("msg", "product is not in cart");
			 }
			 else  if (prodmast.getId()==productId && Integer.parseInt(reqQuantity)>0)
				{
					prodmast.setReqQuantity(0);
					productName = prodmast.getProductName();
					model.addAttribute("msg", "Product " + productName + " is removed from  cart.");
					for(ProductMaster selprodmast : selectedProductsList)
					{
						if(selprodmast.getId()==productId)
						{
							selectedProductsList.remove(selprodmast);
							selprodmast=null;
							session.setAttribute("selectedProductsList", selectedProductsList);
							break;
						}
					}
					session.setAttribute("productlist", productsList);
				}
			
		}
		
		return "show-all-item-user";
		
	}
}
