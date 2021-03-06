import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { PrivacyPolicyComponent} from './privacy-policy/privacy-policy.component';
import { LandingPageComponent } from './landing-page/landing-page.component'

@NgModule({
  declarations: [
    AppComponent,
    PrivacyPolicyComponent,
    LandingPageComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
