describe('product details', () => {

  beforeEach(() => {
    cy.visit("/");
  })

  it("Shows that an item has been added to cart after the user did so", () => {
    cy.get('.end-0 > .nav-link').contains("0")

    cy.get('.button_to > .btn').first().click({ force: true });

    cy.get('.end-0 > .nav-link').contains("1")
  });

})