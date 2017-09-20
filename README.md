# _Library System_

#### _Epicodus two day project with SQL, 9/20/17_

#### By _**Kristen Kulha and L. Devin MacKrell**_

## Description

_This app will allow a library administer to track the addition, removal, and checkout status of books in the library. It will also allow a patron to checkout a book and review the history of their checkouts._

## Setup/Installation Requirements

* _Copy the app from: https://github.com/MacKLess/library_system.git_
* _Clone it to terminal_
* _Set up SQL as follows: (to be completed later)_
* _Open with your preferred browser._

## Specifications

### Book Specifications
* _It will create an instance of a book class._
  * Example input: book = Book.new({:name => "Innerstellar Pig", :author => "William Sleator", :id => nil})
  * Example output: Innerstellar Pig, William Sleater, nil
* _It will save an instance of the book to the database._
  * Example input: book.save
  * Example output: Innerstellar Pig, William Sleator, nil
* _It will return a list of books from the database._
  * Example input: book.find
  * Example output: Innerstellar Pig, William Sleator, nil
* _It will allow user to delete books from the database._
  * Example input: book.delete({:name => "Innerstellar Pig", :author => "William Sleater", :id => nil})
  * Example output: Book.all != [book]
* _ _
  * Example input:
  * Example output:



### Patron Specifications  
* _It will create an instance of the patron class._
  * Example input: patron = Patron.new({:name => "Tom Jones", :id => nil})
  * Example output: Tom Jones, nil
* _It will save an instance of a patron to the database._
  * Example input: patron.save
  * Example output: Tom Jones, nil
* _It will return a list of patrons from the database._
  * Example input: patron.find
  * Example output: Tom Jones, nil
* _It will update a patron in the database._
  * Example input: patron1 = patron.update ({:name => "Jason Megatron Burroughs"})
  * Example output: patron1.name = Jason Megatron Burroughs
* _ _
  * Example input:
  * Example output:





* _It will create an instance of a checkout when a patron checks out a book._
  * Example input:
  * Example output:
* _ _
  * Example input:
  * Example output:
* _ _
  * Example input:
  * Example output:
* _ _
  * Example input:
  * Example output:

## Known Bugs

_There are no known bugs at this time, but this is work in progress._

## Support and contact details

_If you run into any issues or have questions, ideas or concerns, or if you would like to contribute to the code, please contact: ldmackrell@gmail.com._

## Technologies Used

_This application was built using Ruby, Sinatra, and SQL_

### License

Copyright (c) 2017 **_L. Devin MacKrell and Kristen Kulha_**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
