# README




# blocker
AbstractController::DoubleRenderError:
       Render and/or redirect were called multiple times in this action. Please note that you may only call render OR redirect, and at most once per action. Also note that neither redirect nor render terminate execution of the action, so if you want to exit an action after redirecting, you need to do something like "redirect_to(...) and return".

       Checked stack overflow and we were calling render multiple times. We went to our controller method and found that we were doble rendering dino. Render below was removed and code worked. 

def create
    dino = Dino.create(dino_params)
    <!-- render json: dino -->
    if dino.valid?
        render json: dino
    else   
        render json: dino.errors, status: 422
    end
end
