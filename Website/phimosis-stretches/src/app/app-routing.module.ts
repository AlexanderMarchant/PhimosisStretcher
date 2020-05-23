import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AppComponent } from './app.component';

import { PrivacyPolicyComponent} from './privacy-policy/privacy-policy.component'
import { LandingPageComponent } from './landing-page/landing-page.component'


const routes: Routes = [
  { path: 'privacy', component: PrivacyPolicyComponent},
  { path: '', component: LandingPageComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
