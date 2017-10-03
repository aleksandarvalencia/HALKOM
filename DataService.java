/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.projects.halkom.service;

import com.projects.halkom.model.Accounts;
import com.projects.halkom.model.Clients;
import com.projects.halkom.model.ComboValues;
import com.projects.halkom.model.Files;
import com.projects.halkom.model.JsTreeNode;
import com.projects.halkom.model.ProductCodes;
import com.projects.halkom.model.Products;
import java.util.List;

/**
 *
 * @author bd101009
 */
public interface DataService {
    
      
        
        List<JsTreeNode> getTreeView();
        
        List<Clients> allClients();
        
        Clients findClientById(Integer id);
        
        public String findClientNameByRoot(String root);
        
        List<Clients> executeProcClient(String p_akcija, String p_idClient,String p_client,
                String p_nbsAccount,Integer p_status,Integer p_international, String p_ime,String p_opis);
        
        List<Accounts>  getAccountList(String root,String p_akcija);
        List<ComboValues>  getInternational();
        List<ComboValues>  getAuthList();
        
        List<Files> allFiles(String p_datum);
        List<Files> executeProcFiles(String p_akcija,Integer p_idfile, Integer idna);
        
        List<Products> allProducts();
        List<ProductCodes>  getProductList(Integer product);
        Products findProductById(Integer id);
        List<Products> executeProcProduct(String p_akcija, Integer p_idProduct,String p_productcode,String p_productname);
}
