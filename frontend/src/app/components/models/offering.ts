export class Offering {
  id?: number;
  value?: number;
  churchProject?: string;
  offeringDate?: Date;
  memberId?: number; // Assuming the offering links to a member by ID
}
