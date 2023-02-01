/// <reference types="cypress" />

describe("Product Details", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("There is products on the Home page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the Home page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("can navigate from the home page to the product detail page by clicking on a product", () => {
    cy.get(".products article").first().click();
    cy.contains("in stock at");
  });
});
