# OpenVeritoot (working title)

This is for a semi-centralized verification-as-a-service service. Theoretically anyone could operate this.  It is designed to be used with the Mastodon federated network, but could be used more generally with other networks as need be.  
## The vision

OpenVeritoot will operate a database which will contain information on various social media accounts to determine which social media accounts actually belong to the users they claim to be.  For example, right now, anyone can claim the name @barackobama@mastodon.social or any number of accounts across the Mastodon federated network.  

There is a method for verifying an account is associated with a particular website built into Mastodon, simply by placing a special anchor tag somewhere on the html of a website - which proves that the social media account is associated with that website, at least.  However, that can be spoofed with a similar named website that would at first glance, fool "a moron in a hurry".  

The idea is to create the software needed to run a verification service platform.  What it would do is use client-side routing to generate very simple webpages which can be used to verify users by hosting the anchor tag.  

This can be expanded to qualify exactly what kinds of verifications exist for the user with the use of query tags. 

So, for example:

```text
GET http://veritoot.com/v/@barackobama@mastodon.social/

returns a webpage with 

<a rel="me" href="https://mastodon.social/@barackobama">Barack Obama on Mastodon (mastodon.social)</a>
```

@barackobama@mastodon.social can now link back to http://veritoot.com/v/@barackobama@mastodon.social/ and it will show as correctly verified. 

Furthermore, different authorities can provide different types of qualifications.  Specifically, when a user is verified users know:

* Who is this account?  Are they who they claim to be?
* Why are they considered notable?  Are they subject matter experts in what they claim? 
* Who made the decision to verify this user?

For that reason, verifications are not made by the server owner (although it could be the server owner), but by 'authority' accounts, primarily assigned to appropriate organizations. For example, let's say that the New York Times signs up to be an authority. The server owner verifies the authority is who they claim to be/represent.  The NYT applies for "verifications" - specific tags that they can put on a user.  

Expanding it further: 

```text
GET http://veritoot.com/v/@barackobama@mastodon.social/

returns a webpage with 

<a rel="me" href="https://mastodon.social/@barackobama">Barack Obama on Mastodon (mastodon.social)</a>

| VERIFICATION   | auth                         |
|----------------|------------------------------|
| POLITICIAN     | /a/new_york_times            |
| US_PRESIDENT   | /a/new_york_times            |
| CELEBRITY      | /a/veritoot_staff            |
| NETFLIX        | /a/netflix_official          |
| BORN_IN_HAWAII | /a/secretary_of_state_hawaii |

```

What's more, via query parameters, the GET request can also determine if the user has the *exact* verification.  

```text
GET http://veritoot.com/v/@barackobama@mastodon.social/?verified=['politician','born_in_hawaii']

returns the website, as above, with a 200 success. 

BUT 

GET http://veritoot.com/v/@barackobama@mastodon.social/?verified=['hosted_saturday_night_live']

would return a 404 page.  

```

## Okay, why?

The problem with verification is that ultimately, someone has to make the determination whether or not someone is who they claim to be (the "blue checkmark" problem).  In the case of Twitter, that was entirely the determination of the Twitter staff.  And that worked well enough but now there's a problem; because the criteria for that verification is no longer: "Is who they claim to be according to the Twitter staff" but rather "is willing to pay $8/mo for a blue checkmark." At the end of the day, the decisions of Twitter were ultimately arbitrary, so the criteria can change on a dime with new ownership. 

Indeed, the problem is that twitter verification is too centralized - ONLY twitter staff can issue verifications, and that staff is under the instructions of the ownership. 

And the ownership has lost the plot, suspending and deleting accounts critical of the ownership. 

I think that Mastodon is great for it's vision of a decentralized social network, with small servers running on specific niches.  But what it lacks is a way not only to identify high profile users but to find them as well.  

That little blue checkmark was actually Twitter's killer app.  With it, celebrities and other "high value" users would be willing to use their own accounts instead of hiring some social media manager. It allowed for accessibility and authenticity that just couldn't be found in other social media networks. And because Twitter was where you - an average person - could actually have a public (or private!) conversation with celebrities you adored and respected without a whole lot of barrier between you, it became world-changing even when Facebook was gobbling up every other social media network out there (such as Instagram and WhatsApp).  

By having Musk suggest that users pay $20 a month or even $8 a month for that blue checkmark, all of a sudden, that checkmark becomes worthless - if I can create @the_real_barack_obama_for_realsies_no_fooling and get a blue checkmark by paying $8/mo, then the actual Barack Obama has no reason to even associate with the platform. Indeed, that may drive the high value users - the real content creators of the social network! - off the site onto... well, onto something else. 

### Is this a viable approach?

Technically, sure. I'm not sure it's viable as a company - as the options for revenue generation are problematic (as they were with the real Twitter).  And there's problems of scale; operating this on a small virtual server as a proof of concept isn't that hard, what becomes hard is when there are millions of users and billions of accounts.  That's why I do plan to build out veritoot.com on my own but will make the source code open-source so anyone can operate their own verification server. 

It's also very much in keeping with the "mastodon way".  
### What about that technical approach?

For right now I think the best approach is to use a PostgreSQL relational database for most of the core information. 

Ideally we'd have some sort of authorization setup - Auth0 seems to be a good way to handle this without having to assume all the risk of storing sensitive data ourselves.  With that auth setup, we can use JWT to set up an API for the database using Node/Bun and a server framework (Express/Koa, etc.) 

Since everything would be powered from the API, the choice of front-end framework doesn't really matter. I like Next.js and will probably use that to build everything out.  

It's very doable.  
Who knows.  

