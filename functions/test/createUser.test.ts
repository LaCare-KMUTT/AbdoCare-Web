import { expect } from "chai";
import { createUser } from "../src/modules/createUser";
describe("Create User test", () => {
  const test = require("firebase-functions-test")(
    {
      projectId: 'abdocare-bdab0',
      databaseURL: `https://abdocare-bdab0.firebaseio.com`,
    },
    "functions/service_account/abdocare-bdab0-885068dfb284.json"
  );

  console.log(process.env);
  describe("onCreate", () => {
    const myFunction = test.wrap(createUser);

    after(() => {
      myFunction._cleanup();
    });

    it("Creating user should work", () => {
      const data = {
        displayName: "Jest Unit Test",
        email: "unit@domain.com",
        password: "password",
        uid: null,
      };
      const context = {
        auth: {
          token: {
            access: "somestring",
          },
          uid: "mockuiddddd",
        },
      };
      var result = myFunction.createUser(data, context);
      const { status, uid } = result;
      expect(status).equal("success");
      expect(uid).not.be.null;
    });
  });
});
