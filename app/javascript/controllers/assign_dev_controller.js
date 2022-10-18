import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  connect(){     
    this.modal = new bootstrap.Modal(document.getElementById("assignDeveloperModal"), {})
    this.modal.show()        
  }

  // disconnect() {    
  //   console.log("disconnect");
  //   this.modal.hide()          
  // }  
}
