#!/usr/bin/env bash

arr1=(Greetings Hello Hola Bonjour Hi Privet Howdy Ahoy Aloha Konnichiwa)
arr2=(Lord Comrade Master Commander Captain Weirdo King Queen Duchess Duke Chancellor Doctor Marshal Elder Admiral Governor Saint)
arr3=("Go back to your cube!" "Welcome back!" "I know what you did last summer..." "Good day to you!" "The void beckons..." "Let's roll!!" "You are awesome!" "Lovely day isn't it!" "We love you 3000!" "You are the Chosen One ^_^")
arr4=(b d g p s t w y)

RANDOM=`od -t uI -N 4 /dev/urandom | awk '{print $2}'`

selectedgreeting=${arr1[$RANDOM % ${#arr1[@]} ]}
selectedrank=${arr2[$RANDOM % ${#arr2[@]} ]}
selectedmessage=${arr3[$RANDOM % ${#arr3[@]} ]}
cowsayflag=${arr4[$RANDOM % ${#arr4[@]} ]}

echo "$selectedgreeting $selectedrank $USER, $selectedmessage" | cowsay -$cowsayflag
