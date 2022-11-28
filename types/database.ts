export interface Contact {
  email: string;
  name?: string;
  phone?: string;
  text?: string;
  notes?: string;
}

export interface Administrator {
  login: string;
  backupEmail: string;
  contact: Contact;
}

export interface Authority {
  login: string;
  organizationName: string;
  organizationDescription?: string;
  address?: string;
  notes?: string;
  contacts?: Contact[];
}

export interface SocialUser {
  socialLogin: string;
  name: string;
  bio?: string;
  network: string;
  subnetwork?: string;
  contact?: Contact;
}
