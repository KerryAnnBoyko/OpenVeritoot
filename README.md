# OurSpaceSocialNetwork (working title)

Okay, I'll admit that I never took the idea that Musk would buy Twitter seriously. And then I didn't realise how quickly he would make decisions that would drive everything that was actually useful and valuable about Twitter into the ground. 

But here's the thing about Twitter.  Musk paid $44B for a web application that... well, it can't be *that* hard to actually build.  Otherwise there wouldn't be Mastadon and all those crazy right-wing sites popping up. Hard to scale? Sure. Hard to manage? Probably. But not to build. 

And while we're building it, why not make some improvements too?

## The vision

The vision is for a microblogging site (posts will be limited to 512 characters) with the following features: 

* Every USER geta a profile. This will contain a login, display name, profile description, an optional location, an optional link, an icon (image), a masthead (image). 
  * Users can follow other users
  * Users can block other users
  * Users can have conversations with other users
* Every USER can make POSTS. The post will contain content (512 chars)
  * POSTS can use TAGS (using the #hashtag syntax)
  * POSTS can mention USERS (using the @at syntax)
  * POSTS can quote other posts
  * POSTS can reply to other posts
  * POSTS can be reposts of other people's posts
* USERS can REPORT POSTS for conduct/TOS violations
* Some USERS will be designated as AUTHORITIES of a specific field, and can issue VERIFICATIONS to USERs. (See below)
  * AUTHORITIES have access to a set of VERIFICATIONS
  * VERIFICATIONS are titles awarded to USERS primarily to establish that the account is who they say they are, or that they represent who they claim to represent. 


## How AUTHORITIES and VERIFICATIONS work

Basically, AUTHORITIES are subject matter experts or otherwise qualified users who can determine identity.  

For example, a user creates an account called @offical_new_zealand_parliament and applies directly with the administrators of OurSpaceSocialNetwork(Working Title) for the AUTHORITY: "New Zealand Parliament", with the following VERIFICATIONS: "Member of Parliament", "Candidate for Parliament", "Prime Minister", "Official Governmental Organization", and "Mayor of Wellington".  

The Administrators then contact @official_new_zealand_parliament and ask them to do something that only they could do - for example, placing a code on the parliament.gov.nz website.  Once that code has been verified, they will be issued the authority: "New Zealand Parliament", AND automatically the verification: "Authority: New Zealand Parliament"

So far, so good. 

Of the verifications they have asked for, they are immediately issued "Member of Parliament", "Candidate for Parliament", "Prime Minister", "Official Government Organization", as well as the generic: "Official" and "Disavowed". The last one - Mayor of Wellington - is not issued immediately, as it is not certain whether the New Zealand Parliament is the appropriate authority for a regional mayoralty. (It may be, but err on doubt). @official_new_zealand_parliament MAY reapply for that verification giving further supporting documents as to why they should have that verification. 

But in any case, they have access to the other four verifications, plus "official" and "disavowed". 

There are three accounts in question: @jacinda_ardern, @ronald_frump, @prime_minister_of_new_zealand.

@jacinda_ardern is the actual prime minister of New Zealand and can prove to the satisfaction of @official_new_zealand_parliament that it really is her.  
@ronald_frump claims that the election was rigged and that he should be the prime minister of New Zealand.
@prime_minister_of_new_zealand is the account for the *office*, not the person, of prime minister of New Zealand. 

@official_new_zealand_government issues the following Verifications: 
* @jacenda_ardern: "Member of Parliament", "Prime Minister"
* @prime_minister_of_new_zealand, "Prime Minister", "Official", "Official Government Organization"
* @ronald_frump: "Disavowed"

On their profiles, it will read as follows:

* @jacenda_ardern
  * New Zealand Parliament has authorized:
    * Member of Parliament
    * Prime Minister
* @prime_minister_of_new_zealand
  * An Official account of New Zealand Parliment
  * New Zealand Parliament has authorized:
    * Official Government Organization
    * Prime Minister
* @ronald_frump
  * New Zealand Parliament has disavowed Ronald Frump. 

Of course, multiple authorities could overlap and provide different verifications.  For example, @jacinda_ardern's full profile could read: 

* @jacenda_ardern
  * New Zealand Parliament has authorized:
    * Member of Parliament
    * Prime Minister
  * New Zealand Labour Party has authorized:
    * Member of the Labour Party
    * Leader of the Labour Party
  * OSSN Administration
    * Public Figure (Regional - New Zealand)
    * Celebrity (Regional - New Zealand)

### Why this approach?

The problem with verification is that ultimately, someone has to make the determination whether or not someone is who they claim to be (the "blue checkmark" problem).  In the case of Twitter, that was entirely the determination of the Twitter staff.  And that worked well enough but now there's a problem; because the criteria for that verification is no longer: "Is who they claim to be according to the Twitter staff" but rather "is willing to pay $8/mo for a blue checkmark." At the end of the day, the decisions of Twitter were ultimately arbitrary, so the criteria can change on a dime with new ownership. 

### Is this a viable approach?

Technically, sure. I'm not sure it's viable as a company - as the options for revenue generation are problematic (as they were with the real Twitter).  And there's problems of scale; operating this on a small virtual server as a proof of concept isn't that hard, what becomes hard is when there are millions of users and billions of accounts.  

### What about that technical approach?

For right now I think the best approach is to use a PostgreSQL relational database for most of the core information. (A graph database was considered but might not be appropriate for this problem).  Some data will be stored in a NoSQL document Mongo database (conversations, for example, can be of arbitrary length - it may be best to store that information in a Mongo DB and just reference the MongoID in the PSQL tables)

Ideally we'd have some sort of authorization setup - Auth0 seems to be a good way to handle this without having to assume all the risk of storing sensitive data ourselves.  With that auth setup, we can use JWT to set up an API for the database using Node/Bun and a server framework (Express/Koa, etc.) 

Since everything would be powered from the API, the choice of front-end framework doesn't really matter. I like React, but this could be done with Preact, Vue, anything, really. 

Long story short? The problem is *big* but it's not complex.  It's very doable, even by a small dedicated team of engineers.  In many ways it's already been done by Mastodon. 

## If it's already been done by Mastodon, why not use/improve Mastodon?

I think that Mastodon is great for it's vision of a decentralized social network, with small servers running on specific niches.  But centralization was actually one of Twitter's key selling points, as only a central authority could really determine things such as verification. 

That little blue checkmark was actually Twitter's killer app.  With it, celebrities and other "high value" users would be willing to use their own accounts instead of hiring some social media manager. It allowed for accessibility and authenticity that just couldn't be found in other social media networks. And because Twitter was where you - an average person - could actually have a public (or private!) conversation with celebrities you adored and respected without a whole lot of barrier between you, it became world-changing even when Facebook was gobbling up every other social media network out there (such as Instagram and WhatsApp).  

By having Musk suggest that users pay $20 a month or even $8 a month for that blue checkmark, all of a sudden, that checkmark becomes worthless - if I can create @the_real_barack_obama_for_realsies_no_fooling and get a blue checkmark by paying $8/mo, then the actual Barack Obama has no reason to even associate with the platform. Indeed, that may drive the high value users - the real content creators of the social network! - off the site onto... well, onto something else. 

## Are you actually planning to build this yourself?

Eh... maybe. I work a 9/5 day job which I have to keep because I'm on a work visa for the UK. I also have other hobbies and friends. So I can't put my full time into this.  Do I think I could get something like this started?  Sure.  Maybe if it has legs we can see what happens from there.  Right now this is just a Readme, a proposed SQL schema, and a few docs.

Who knows.  