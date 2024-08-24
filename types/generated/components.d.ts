import type { Schema, Attribute } from '@strapi/strapi';

export interface MenuFooterSectionFooter extends Schema.Component {
  collectionName: 'components_menu_footer_section_footers';
  info: {
    displayName: 'SectionFooter';
    description: '';
  };
  attributes: {
    title: Attribute.String & Attribute.Required;
    menu: Attribute.Component<'menu.link', true>;
  };
}

export interface MenuLink extends Schema.Component {
  collectionName: 'components_menu_links';
  info: {
    displayName: 'Link';
    description: '';
  };
  attributes: {
    text: Attribute.String;
    order: Attribute.Integer;
    href: Attribute.String;
    type: Attribute.Enumeration<['Regular', 'OnlyIcon', 'OnlyText']> &
      Attribute.DefaultTo<'Regular'>;
    active: Attribute.Boolean & Attribute.DefaultTo<true>;
    badge: Attribute.Boolean & Attribute.DefaultTo<false>;
    icon: Attribute.String;
  };
}

export interface MenuDropdown extends Schema.Component {
  collectionName: 'components_menu_dropdowns';
  info: {
    displayName: 'Dropdown';
    icon: 'arrowDown';
    description: '';
  };
  attributes: {
    text: Attribute.String;
    subMenu: Attribute.Component<'menu.link', true>;
    order: Attribute.Integer;
  };
}

declare module '@strapi/types' {
  export module Shared {
    export interface Components {
      'menu-footer.section-footer': MenuFooterSectionFooter;
      'menu.link': MenuLink;
      'menu.dropdown': MenuDropdown;
    }
  }
}
