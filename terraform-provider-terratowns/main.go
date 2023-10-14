// package main declares the package name
package main

//The code starts with the declaration package main. In Go, the package declaration at the beginning 
//of a Go source file defines the package to which the file belongs. In this case, we're defining a package named "main."
// A Go program must have a main package, and it's the entry point for executing the program.
import (
	// "log"
	"fmt"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
	"github.com/hashicorp/terraform-plugin-sdk/v2/plugin"
)
//Next, we import the "fmt" package. The "fmt" package (short for "format") 
//is part of the Go standard library and provides functions for formatted 
//input and output. We'll use it to print the "Hello, World!" message.
//We define a main function using the func keyword. The main function is the 
//entry point of a Go program, and it is automatically executed when the program runs.
//Inside the main function, we use the fmt.Println function to print the "Hello, World!"
// message to the standard output (usually the console). This function takes a string as
// an argument and prints it to the console followed by a newline character.

func main() {
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: Provider,
	})
	//format print line
	fmt.Println("Hello, World!")
}

func Provider() *schema.Provider {
	var p *schema.Provider
	p = &schema.Provider{
		ResourcesMap: map[string]*schema.Resource{

		},
		DataSourcesMap: map[string]*schema.Resource{

		},
		Schema: map[string]*schema.Schema{
			"endpoint": {
				Type: schema.TypeString,
				Required: true,
				Description: "The endpoint for the external service",
			},
			"token": {
				Type: schema.TypeString,
				Sensitive: true,
				Required: true,
				Description: "The bearer token for authorization",
			},
			"user_uuid": {
				Type: schema.TypeString,
				Required: true,
				Description: "UUID for configuration",
				// ValidateFunc: validateUUID,
			},
		},
	}
	//p.ConfigureContextFunc = providerConfigure(p)
	return p
}


// func validateUUID(v interface{}, k string) (ws []string, errors []error){
// 	log.Print{'validateUUID:start'}
// 	value := v.(string)
// 	if _.err = uuid.Parse(value); err != nil {
// 		errors = append(error, fmt.Errorf("invalid UUID format"))
// 	}
// 	log.Print('validateUUID:end')
// }