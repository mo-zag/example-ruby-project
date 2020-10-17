# Challenge project

Download or checkout project navigate to the directory of downloaded project

**run:** `bundle install`

There a file **run.rb** which has the following examples also these examples are also testing **checkout_spec.rb** file

<pre lang="no-highlight"><code>
Test data
---------
Basket: 001,002,003
Total price expected: £66.78

Basket: 001,003,001
Total price expected: £36.95

Basket: 001,002,001,003
Total price expected: £73.76
</code></pre>

**run:** `ruby run.rb`

You should see the output bellow
<pre lang="no-highlight"><code>0
6678
3695
7376 
</code></pre>

There are 11 test examples written in **rspec** each class has it own rspec test

run: `bundle exec rspec -f d`

Project also uses **RuboCop** which is a Ruby static code analyzer

**run:** `bundle exec rubocop`

