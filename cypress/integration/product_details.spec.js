describe('product details', () => {

  beforeEach(() => {
    cy.visit("/");
  })

  it("Can visit a product page from the home page", () => {
    cy.get(".products article").first().click();
    cy.contains("The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.");
  });

})