# SHORT URL

Short url is a proyect that works like bit.ly, it let you take a long url and change its on a short url for you can use it and send the link to your friends
  - create your own short links and share it with friends
  - see what are these more visited websites
  - use it for remember links easily

### Installation

1. Clone this repository
2. You will need to install:
- redis v5.0
- ruby v2.6.3
- rails v6.0.0
- nvm or rbenv
- yarn
- postgresql
2. Execute bundle install
3. Excecute rails db:migrate

### How it woks

#### Algorithm

- First we need a url to modify for example: https://www.amazon.com/b?node=18332383011&pf_rd_p=738205f7-6bfe-4423-bacb-73a824c6a296&pf_rd_r=WP18PP2A1EMBX94032TF

- The next is generate a short url but redirecting to our url
so for this exercise we will use the these gems
public_uid: Generates random string (or random number) to represent public unique record identifier. https://github.com/equivalent/public_uid

- Following the ideas order we need link the short link to our webside so we create the string 
url_base + " / " + public_uid_code

- At this point we have  a short link, but still isn't working that's because just have created a string the next step is make our web redirects that link generated to the real link (with the one what  we started).

- For this we wiil use the model url we will create an url object to save
    - Original link  as: long_url
    - New link as: short_url
    - Redirections as :redirects_amount
    - Tittle of the page as:  page_tittle

  So we save the object for future redirections.

- The next step is define the logic to when a user use a link this goes to our page and redirect it to the wished url, so basically the idea is receive a petition of type short_url then its is searched at the database for rescue the long_url and redirect the page to long_url and we count that redirect.