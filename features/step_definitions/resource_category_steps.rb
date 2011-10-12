Given /^I have no resource_categories$/ do
  ResourceCategory.delete_all
end

Given /^I (only )?have resource_categories titled "?([^\"]*)"?$/ do |only, titles|
  ResourceCategory.delete_all if only
  titles.split(', ').each do |title|
    ResourceCategory.create(:title => title)
  end
end

Then /^I should have ([0-9]+) resource_categor[y|ies]+?$/ do |count|
  ResourceCategory.count.should == count.to_i
end
