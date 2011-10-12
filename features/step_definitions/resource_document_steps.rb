Given /^I have no resource_documents$/ do
  ResourceDocument.delete_all
end

Given /^I (only )?have resource_documents titled "?([^\"]*)"?$/ do |only, titles|
  ResourceDocument.delete_all if only
  titles.split(', ').each do |title|
    ResourceDocument.create(:name => title)
  end
end

Then /^I should have ([0-9]+) resource_documents?$/ do |count|
  ResourceDocument.count.should == count.to_i
end
