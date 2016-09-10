package entity;


public class CakePart 
{
    private String type; //top/bottom
    private String name;
    private String price;

    public CakePart(String type, String name, String price) 
    {
        this.type = type;
        this.name = name;
        this.price = price;
    }

    public String getType() 
    {
        return type;
    }

    public void setType(String type) 
    {
        this.type = type;
    }

    public String getName() 
    {
        return name;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getPrice() 
    {
        return price;
    }

    public void setPrice(String price) 
    {
        this.price = price;
    }
    
    public String toString()
    {
        return this.name + "|" + this.price + "$";
    }
    
    
}
