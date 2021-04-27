package bank

class CreditCardRequest {

    String name
    String email
    String phoneNumber
    String salary



    static constraints = {
        name nullable: false
        email nullable: false
        phoneNumber nullable: false
        salary nullable: false
    }
}
