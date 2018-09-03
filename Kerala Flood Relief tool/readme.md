Page 1 – Home Page
It has two options - One: Request for Help (Redirects to Page 2), Second one: Registered Requests
 

Page 2: “Request Submission form”
It is form page which contains following fields
    • District (Drop down list with min five values – Palakkad, Kochi, Coimbatore, Salem etc)
    • Location (Text box)
    • Name (Text box)
    • Phone number (Numeric field)
    • Requested items (Mult-select check box with options: Food, water, Clothing, Medicines)
    • Date (Automatically populated current date/time which is readonly)
Store content of this form to AWS S3 when “Submit” button has been clicked 



Page 3: “Registered Requests”
It should pull the requests submitted through page 2 in tabular form (Read from AWS S3 all stored data and show them in tabular manner. Sample table below)

![screenshot from 2018-09-03 20-48-31](https://user-images.githubusercontent.com/17880433/44994127-d8bf6580-afba-11e8-8970-52b9c00eaf44.png)
