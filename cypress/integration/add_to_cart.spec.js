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

  it("add to cart and updates cart count by 1", () => {
    cy.contains("My Cart (0)");
    cy.get(".products article").first().contains("Add").click({ force: true });
    cy.contains("My Cart (1)");
  });
});
