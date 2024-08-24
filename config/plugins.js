module.exports = () => ({
    "users-permissions": {
        config: {
            register: {
                allowedFields: ["first_name", "last_name", "identificationNumber", "phone", "city", "state","country", "birthdate"],
            },
        },
    },
});
