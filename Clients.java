/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.projects.halkom.model;



/**
 *
 * @author bd101009
 */
public class Clients 
{
  String idClient ;
  String root ;
  String clientName;  
  String nbsAccount;        
  String opis;   
  Integer status; 
  Integer international;
  Integer search;
  String statusDescription;
  String internationalDescription;

    public String getStatusDescription() {
        return statusDescription;
    }

    public void setStatusDescription(String statusDescription) {
        this.statusDescription = statusDescription;
    }

    public String getInternationalDescription() {
        return internationalDescription;
    }

    public void setInternationalDescription(String internationalDescription) {
        this.internationalDescription = internationalDescription;
    }
  
  
    public Integer getSearch() {
        return search;
    }

    public void setSearch(Integer search) 
    {
        if ("".equals(search))
        {
            search=0;
        }

        this.search = search;
    }

    public String getIdClient() {
        return idClient;
    }

    public void setIdClient(String idClient) {
        this.idClient = idClient;
    }

    public String getRoot() {
        return root;
    }

    public void setRoot(String root) {
        this.root = root;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getNbsAccount() {
        return nbsAccount;
    }

    public void setNbsAccount(String nbsAccount) {
        this.nbsAccount = nbsAccount;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
        String stat="Yes";
        if (status==0)
        {
            stat="No";
        }
        setStatusDescription(stat);
    }

    public Integer getInternational() {
        return international;
    }

    public void setInternational(Integer international) {
        this.international = international;
        String inter="Yes";
        if (international==0)
        {
            inter="No";
        }
        setInternationalDescription(inter);
    }
  
  
  
  
  
  
  
}
