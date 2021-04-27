package bank

import grails.converters.JSON

class CreditCardsController {

    def index() {
        render view: "index"
    }

    def creditCardRequest(params){
        try {
            CreditCardRequest cardRequest = new CreditCardRequest()
            cardRequest.name = params?.name
            cardRequest.email = params?.email
            cardRequest.phoneNumber = params?.phoneNumber.toString()
            cardRequest.salary = params?.salary.toString()
            cardRequest.insert(Flush:true)
            println(cardRequest.salary)
            render([success:true] as JSON)


        }catch(Exception e){
            log.error("error while saving cc request")
        }

    }
}
