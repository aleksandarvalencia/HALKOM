/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.projects.halkom.controller;
//import com.projects.halkom.model.DatePicker;
//import java.util.ArrayList;
//import java.util.LinkedList;
//import java.util.LinkedHashMap;
//import java.util.List;
//import java.awt.List;
//import java.util.Map;
import javax.servlet.http.HttpServletRequest;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
/*import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;*/
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
//import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.projects.halkom.exceptions.DatabaseException;
import com.projects.halkom.exceptions.DataAccessException;
import com.projects.halkom.exceptions.CustomException;
import com.projects.halkom.model.Accounts;
import com.projects.halkom.model.Clients;
import com.projects.halkom.model.ComboValues;
import com.projects.halkom.model.Files;
import com.projects.halkom.model.ProductCodes;
import com.projects.halkom.model.Products;
//import com.projects.halkom.model.ComboValues;
//import com.projects.halkom.model.FormDate;
import com.projects.halkom.service.DataService;
import com.projects.halkom.service.UserService;
import com.projects.halkom.validation.UserFormValidator;
import com.projects.halkom.validation.FormDateValidator;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
//import java.util.ArrayList;
import java.util.List;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
//import com.projects.trade.exceptions.GlobalExceptionHandler;
//import com.projects.trade.model.JsTreeNode;
//import com.projects.trade.model.TData;
//import com.projects.trade.model.Attributes;
//import java.util.ArrayList;
//import java.util.List;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MenuProgramController {
    
//private final Logger logger = LoggerFactory.getLogger(MenuProgramController.class);
        String nodetext="";
        //StringBuilder sb=new StringBuilder();
        //StringBuilder append;
        String append="";

	@Autowired
	UserFormValidator userFormValidator;
        
        @Autowired
	FormDateValidator formDateValidator;
	
       
        @InitBinder("user")
        protected void initUserBinder(WebDataBinder binder) {
            //SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
            //dateFormat.setLenient(false); 
            //binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
            binder.setValidator(userFormValidator);
        }

        @InitBinder("formdate")
        protected void initPaymentBinder(WebDataBinder binder) {
            binder.setValidator(formDateValidator);
        }
        
	private DataService dataService;

	@Autowired
	public void setDataService(DataService dataService) {
		this.dataService = dataService;
	}
        
        private UserService userService;

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

     
    
        @RequestMapping(value = "/clientsList", method = RequestMethod.GET/*,produces="application/json"*/)
	public /*@ResponseBody*/ String showAllUsers(Model model) 
        {
            if (userService.getlogStatus()==0)
            {
                throw new CustomException("Niste ulogovani!!!");
                //return "redirect:/login";
            }
                //logger.debug("showAllPrograms()");
                model.addAttribute("clients", dataService.allClients());
		return "/clients/clientlist";
         }
        @RequestMapping(value = "/clients/insert", method = RequestMethod.POST)
	public String insertUser(@ModelAttribute("clientsForm") Clients cls,//!!!! SKLONIO SAM @Validated TREBA VRATITI
			BindingResult result, Model model, final RedirectAttributes redirectAttributes) {

		//logger.debug("saveOrUpdateUser() : {}", prg);
                String akcija="insertNew";
                dataService.executeProcClient(akcija, null, cls.getRoot(),cls.getNbsAccount(), cls.getStatus(), cls.getInternational(), cls.getClientName(),cls.getOpis());
                return "redirect:/clientsList";
	}
        
       
        @RequestMapping(value = "/searchClient/{root}/{name}", method = RequestMethod.POST/*,produces="application/json"*/)
	public String searchClientP(@PathVariable("root") String root,@PathVariable("name") String name ,Model model) 
        {

                String akcija="search";
                if ("xx".equals(root))
                {
                    root="";
                }
                if ("xx".equals(name))
                {
                    name="";
                }
                List<Clients> client =  dataService.executeProcClient(akcija, null, root,null, null, null, name,null);
		model.addAttribute("clients", client);
                return "/clients/clientlist";
         }
         
        @RequestMapping(value = "/searchClient", method = RequestMethod.GET)
	public String searchClient(Model model,HttpServletRequest request) 
        {

            if (userService.getlogStatus()==0)
            {
                throw new DataAccessException("You're not logged!!!");
                //return "redirect:/login";
            }
		//logger.debug("showAddProgram()");
		Clients client = new Clients();
		client.setIdClient("");
		client.setClientName("");
		client.setInternational(0);
		client.setStatus(0);
		client.setOpis("");
                client.setRoot("");
                client.setNbsAccount("");
                client.setSearch(1);

		model.addAttribute("clients", client);
		return "clients/clientlist";

	}
	// show add user form
	@RequestMapping(value = "/newClient", method = RequestMethod.GET)
	public String showAddUserForm(Model model,HttpServletRequest request) 
        {

            if (userService.getlogStatus()==0)
            {
                throw new DataAccessException("You're not logged!!!");
                //return "redirect:/login";
            }
		//logger.debug("showAddProgram()");
		Clients client = new Clients();
		client.setIdClient("");
		client.setClientName("");
		client.setInternational(0);
		client.setStatus(0);
		client.setOpis("");
                client.setRoot("");
                client.setNbsAccount("");

		model.addAttribute("clientsForm", client);
                //request.setAttribute("accounts", dataService.getAccountList());
                nodetext="clients/clientsform";
		return nodetext;

	}
	@RequestMapping(value = "/clients/{id}/update", method = RequestMethod.GET)
	public  String showUpdateProgramForm(@PathVariable("id") int id, Model model,HttpServletRequest request) {
		//logger.debug("showUpdateProgramForm() : {}", id);
            
            
           if (userService.getlogStatus()==0)
            {
                throw new DataAccessException("You're not logged!!!");
                //return "redirect:/login";
            }
                Clients client = dataService.findClientById(id);
		model.addAttribute("clientsForm", client);
                String p_akcija="clientAccounts";
                request.setAttribute("accounts", dataService.getAccountList(client.getRoot(),p_akcija));
                request.setAttribute("internationals", dataService.getInternational());
		return "clients/clientsform";
	}
        
        @RequestMapping(value = "/clients/{upid}/update", method = RequestMethod.POST)
	public String UpdateUserForm(@PathVariable("upid") int upid,@ModelAttribute("clientsForm")  Clients cls) {

		//logger.debug("UpdateUserForm() : {}", upid);
            
                if (userService.getlogStatus()==0)
               {
                   throw new DataAccessException("You're not logged!!!");
                   //return "redirect:/login";
               }
                String akcija="editUpdate";
                dataService.executeProcClient(akcija, cls.getIdClient(), cls.getRoot(),cls.getNbsAccount(), cls.getStatus(), cls.getInternational(), cls.getClientName(),cls.getOpis());
		return "redirect:/clients/" + cls.getIdClient();

	}
        
        @RequestMapping(value="/accounts",method=RequestMethod.GET)   //OVO JE DIREKTNO POZIVANJE JSP STRANICA
        public @ResponseBody List<Accounts> FindAllAccounts(@RequestParam(value="client", required=true) String client,@ModelAttribute("clientsForm") Clients cls) //ResponseBody kaze da je ovo kontent koji vracamo na stranicu i mi smo odgovorni za njegovo pojavljivanje
        {
           String p_akcija="accountList";
           return dataService.getAccountList(client,p_akcija);

        }
        @RequestMapping(value="/intercombo",method=RequestMethod.GET)   //OVO JE DIREKTNO POZIVANJE JSP STRANICA
        public @ResponseBody List<ComboValues> FindComboValue() //ResponseBody kaze da je ovo kontent koji vracamo na stranicu i mi smo odgovorni za njegovo pojavljivanje
        {

             return dataService.getInternational();
        }
        @RequestMapping(value="/clientname",method=RequestMethod.GET)   //OVO JE DIREKTNO POZIVANJE JSP STRANICA
        public @ResponseBody String FindClientName(@RequestParam(value="root", required=true) String root,@ModelAttribute("clientsForm") Clients cls) //ResponseBody kaze da je ovo kontent koji vracamo na stranicu i mi smo odgovorni za njegovo pojavljivanje
        {

           return dataService.findClientNameByRoot(root);

        }
        
    // delete user
    //@ExceptionHandler(GlobalExceptionHandler.class)
	@RequestMapping(value = "/clients/{delid}/delete/{rootid}", method = RequestMethod.POST)
	public String deleteUser(@PathVariable("delid") String delid, @PathVariable("rootid") String rootid,Model model) throws Exception
        {
              
            if (userService.getlogStatus()==0)
            {
                throw new DataAccessException("You're not logged!!!");
                //return "redirect:/login";
            }
            try
               {
                    String akcija="deleteClient";
                    dataService.executeProcClient(akcija, delid, null,null,null, null, null,null);
                    akcija="search";
                    List<Clients> client =  dataService.executeProcClient(akcija, null, rootid,null, null, null, null,null);
                    model.addAttribute("clients", client);
                    return "/clients/clientlist";
                   
               }
               catch(Exception exo)
               {
                   throw new CustomException(exo.getMessage());
               }
	}

	// show user
	@RequestMapping(value = "/clients/{id}", method = RequestMethod.GET)
	public String showUser(@PathVariable("id") int id, Model model) {


            if (userService.getlogStatus()==0)
            {
                throw new DataAccessException("You're not logged!!!");
                //return "redirect:/login";
            }
            Clients client = dataService.findClientById(id);

	    model.addAttribute("clients", client);
              
	    return "clients/clientshow";
	}
        
        @RequestMapping(value = "/files", method = RequestMethod.GET/*,produces="application/json"*/)
	public String showAllFiles(Model model) 
        {
                
           if (userService.getlogStatus()==0)
            {
                throw new DataAccessException("You're not logged!!!");
                //return "redirect:/login";
            }
                DateFormat dateFormat = new SimpleDateFormat("dd.MM.YYYY");
                Date datum=new Date();
                String dat=dateFormat.format(datum);    
                model.addAttribute("filesForm", dataService.allFiles(dat));
		return "/files/filetable";
         }
        @RequestMapping(value = "/files/{datum}", method = RequestMethod.POST/*,produces="application/json"*/)
	public String showAllFilesForDate(@PathVariable("datum") @DateTimeFormat(pattern="yyyy-MM-dd") Date filedate ,Model model) 
        {
               
             if (userService.getlogStatus()==0)
            {
                throw new DataAccessException("You're not logged!!!");
                //return "redirect:/login";
            }
                DateFormat dateFormat = new SimpleDateFormat("dd.MM.YYYY");
                String dat=dateFormat.format(filedate);
                model.addAttribute("filesForm", dataService.allFiles(dat));
		return "/files/filetable";
         }
         
        @RequestMapping(value = "/filedetails/{pid}/details", method = RequestMethod.GET/*,produces="application/json"*/)
	public String showFileDetails(@PathVariable("pid") int pid,Model model) 
        {
             if (userService.getlogStatus()==0)
            {
                throw new DataAccessException("You're not logged!!!");
                //return "redirect:/login";
            }
            
                String akcija="details";
                model.addAttribute("fileDetails",dataService.executeProcFiles(akcija, null,pid));
		return "/files/filedetails";
         }

        @RequestMapping(value = "/filetable/{sid}", method = RequestMethod.GET/*,produces="application/json"*/)
	public String showFileTable(@PathVariable("sid") int sid,@ModelAttribute("filesForm")  Files fls,Model model) 
        {
                
           if (userService.getlogStatus()==0)
            {
                throw new DataAccessException("You're not logged!!!");
                //return "redirect:/login";
            }
                String akcija="select";
                model.addAttribute("filesForm",dataService.executeProcFiles(akcija, sid,null));
		return "/files/filelist";
         }

        
    //------------------------- PRODUCT CODES ------------------------------------------------//
         @RequestMapping(value = "/searchProduct/{pcroot}/{pcname}", method = RequestMethod.POST/*,produces="application/json"*/)
	public String searchProductP(@PathVariable("pcroot") String pcroot,@PathVariable("pcname") String pcname ,Model model) 
        {

                String akcija="search";
                if ("xx".equals(pcroot))
                {
                    pcroot="";
                }
                if ("xx".equals(pcname))
                {
                    pcname="";
                }
                List<Products> products =  dataService.executeProcProduct(akcija,null, pcroot, pcname);
		model.addAttribute("products", products);
                return "product_codes/productlist";
         }
         
        @RequestMapping(value="/productcodes",method=RequestMethod.GET)   //OVO JE DIREKTNO POZIVANJE JSP STRANICA
        public @ResponseBody List<ProductCodes> FindAllProducts(@RequestParam(value="product", required=true) Integer product) //ResponseBody kaze da je ovo kontent koji vracamo na stranicu i mi smo odgovorni za njegovo pojavljivanje
        {

           return dataService.getProductList(product);

        }
        @RequestMapping(value = "/searchProduct", method = RequestMethod.GET)
	public String searchProduct(Model model,HttpServletRequest request) 
        {

             if (userService.getlogStatus()==0)
            {
                throw new DataAccessException("You're not logged!!!");
                //return "redirect:/login";
            }
		//logger.debug("showAddProgram()");
		Products product = new Products();
		product.setIdProduct(0);
		product.setProductCode("");
		product.setProductName("");

		model.addAttribute("products", product);
		return "product_codes/productlist";

	}
	// show add user form
	@RequestMapping(value = "/newProduct", method = RequestMethod.GET)
	public String showAddProductForm(Model model,HttpServletRequest request) 
        {
            
            if (userService.getlogStatus()==0)
            {
                throw new DataAccessException("You're not logged!!!");
                //return "redirect:/login";
            }
		//logger.debug("showAddProgram()");
		Products product = new Products();
		product.setIdProduct(0);
		product.setProductCode("");
		product.setProductName("");

		model.addAttribute("productsForm", product);
                request.setAttribute("productcodes", dataService.getProductList(null));
                nodetext="product_codes/productform";
		return nodetext;

	}
	@RequestMapping(value = "/products/{prid}/update", method = RequestMethod.GET)
	public  String showUpdateProductForm(@PathVariable("prid") int id, Model model,HttpServletRequest request) {
		//logger.debug("showUpdateProgramForm() : {}", id);
               
            if (userService.getlogStatus()==0)
            {
                throw new DataAccessException("You're not logged!!!");
                //return "redirect:/login";
            }
            Products product = dataService.findProductById(id);
	    model.addAttribute("productsForm", product);
            request.setAttribute("productcodes", dataService.getProductList(product.getIdProduct()));
            return "product_codes/productform";
	}
        
        @RequestMapping(value = "/products/{pcid}/update", method = RequestMethod.POST)
	public String UpdateProductForm(@PathVariable("pcid") int pcid,@ModelAttribute("productsForm")  Products prod) {

		//logger.debug("UpdateUserForm() : {}", upid);
                String akcija="editUpdate";
                dataService.executeProcProduct(akcija, pcid, prod.getProductCode(),prod.getProductName());
		return "redirect:/products";

	}
        
        @RequestMapping(value = "/products/{delpcid}/delete/{rootpcid}", method = RequestMethod.POST)
	public String deleteProduct(@PathVariable("delpcid") Integer delpcid, @PathVariable("rootpcid") String rootid,Model model) throws Exception
        {
               try
               {
                    String akcija="delete";
                    dataService.executeProcProduct(akcija, delpcid, null,null);
                    akcija="search";
                    List<Products> product =  dataService.executeProcProduct(akcija, delpcid, rootid,null);
                    model.addAttribute("products", product);
                    return "redirect:/products";
                   
               }
               catch(Exception exo)
               {
                   throw new CustomException(exo.getMessage());
               }
	}
        @RequestMapping(value = "/products/insert", method = RequestMethod.POST)
	public String insertProduct(@ModelAttribute("productsForm") Products prod,//!!!! SKLONIO SAM @Validated TREBA VRATITI
			BindingResult result, Model model, final RedirectAttributes redirectAttributes) {

		//logger.debug("saveOrUpdateUser() : {}", prg);
                String akcija="insertNew";
                dataService.executeProcProduct(akcija, null, prod.getProductCode(),prod.getProductName());
                return "redirect:/products";
	}
        
        @RequestMapping(value = "/products", method = RequestMethod.GET)
	public String showProducts(HttpServletRequest request,Model model) 
        {
            if (userService.getlogStatus()==0)
            {
                throw new DataAccessException("You're not logged!!!");
                //return "redirect:/login";
            }
            model.addAttribute("products", dataService.allProducts());
            return "/product_codes/productlist";

	}

    //----------------------------------------------------------------------------------------//
        @ExceptionHandler(EmptyResultDataAccessException.class)
	public ModelAndView handleEmptyData(HttpServletRequest req, Exception ex) {

		//logger.debug("handleEmptyData()");
		//logger.error("Request: {}, error ", req.getRequestURL(), ex);

		ModelAndView model = new ModelAndView();
		model.setViewName("programs/programshow");
		model.addObject("msg", "program not found");

		return model;

	}
        @ExceptionHandler(DatabaseException.class)
	public ModelAndView handleDatabaseException(DatabaseException ex) {

		ModelAndView model = new ModelAndView("/users/errorhandler");
		model.addObject("message", ex.getMessage());
		return model;

	}
        
        @ExceptionHandler(CustomException.class)
	public ModelAndView handleCustomException(CustomException ex) {

		ModelAndView model = new ModelAndView("/users/errorhandler");
		model.addObject("message", ex.getMessage());
		return model;

	}
        
        @ExceptionHandler(DataAccessException.class)
	public ModelAndView handleAccessException(DataAccessException ex) {

		ModelAndView model = new ModelAndView("/users/loginerror");
		model.addObject("message", ex.getMessage());
		return model;

	}
    
}
