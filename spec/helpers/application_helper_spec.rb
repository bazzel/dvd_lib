require File.dirname(__FILE__) + '/../spec_helper'
include SilkspriteHelper

describe ApplicationHelper do

  describe "button_tag" do
    it "renders a button" do
      helper.button_tag.should have_tag("button", /Submit/) do
        with_tag "span"
      end
    end

    it "renders button with attributes" do
      helper.button_tag.should have_tag("button.button.positive")
      helper.button_tag.should have_tag("button[type=?]","submit")
    end

    it "renders button with a custom value" do
      helper.button_tag('Save').should have_tag("button", /Save/)
    end

  end
  
  describe "cancel link" do
    it "renders a predefined link" do
      helper.cancel_link("www.kabisa.nl").should have_tag("a.button.negative")
      helper.cancel_link("www.kabisa.nl").should have_tag("a[href=?]", "www.kabisa.nl")
    end
  end
  
end
