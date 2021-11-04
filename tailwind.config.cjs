const plugin = require('tailwindcss/plugin');
const colors = require('tailwindcss/colors');

const config = {
	mode: 'jit',
	purge: ['./src/**/*.{html,js,svelte,ts}'],
	theme: {
		colors: {
			...colors
		},
		extend: {
			height: {
				'95-px': '95px',
				'70-px': '70px',
				'350-px': '350px',
				'500-px': '500px',
				'600-px': '600px'
			},
			zIndex: {
				'-50': '-50'
			}
		}
	},
	plugins: [
		require('@tailwindcss/forms'),
		plugin(function ({ addComponents, theme }) {
			const screens = theme('screens', {});
			addComponents([
				{
					'.container': { width: '100%' }
				},
				{
					[`@media (min-width: ${screens.sm})`]: {
						'.container': {
							'max-width': '640px'
						}
					}
				},
				{
					[`@media (min-width: ${screens.md})`]: {
						'.container': {
							'max-width': '768px'
						}
					}
				},
				{
					[`@media (min-width: ${screens.lg})`]: {
						'.container': {
							'max-width': '1024px'
						}
					}
				},
				{
					[`@media (min-width: ${screens.xl})`]: {
						'.container': {
							'max-width': '1280px'
						}
					}
				},
				{
					[`@media (min-width: ${screens['2xl']})`]: {
						'.container': {
							'max-width': '1280px'
						}
					}
				}
			]);
		})
	]
};

module.exports = config;
